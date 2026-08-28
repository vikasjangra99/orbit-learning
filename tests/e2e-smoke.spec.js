const { test, expect } = require('@playwright/test');

const publicUrl = 'https://vikasjangra99.github.io/orbit-learning/';

test('anonymous visitor sees the account landing page', async ({ page }) => {
  await page.goto(publicUrl, { waitUntil: 'networkidle' });
  await expect(page.getByRole('heading', { name: 'Learn what matters to you.' }).first()).toBeVisible();
  await expect(page.getByRole('button', { name: 'Sign in', exact: true })).toBeVisible();
  await expect(page.getByRole('button', { name: 'Create account', exact: true })).toBeVisible();
  await expect(page.getByLabel('EMAIL')).toBeVisible();
  await expect(page.getByLabel('PASSWORD')).toBeVisible();
  await expect(page.getByRole('button', { name: 'Continue with Google' })).toBeVisible();
});

test('account form validates before sending a request', async ({ page }) => {
  await page.goto(publicUrl, { waitUntil: 'networkidle' });
  await page.getByRole('button', { name: 'Create account', exact: true }).click();
  await expect(page.getByRole('heading', { name: 'Create your learning space.' })).toBeVisible();
  await page.getByLabel('EMAIL').fill('not-an-email');
  await page.getByLabel('PASSWORD').fill('short');
  await page.locator('#authSubmit').click();
  await expect(page.getByLabel('EMAIL')).toHaveAttribute('type', 'email');
});
