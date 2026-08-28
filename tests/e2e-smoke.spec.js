const { test, expect } = require('@playwright/test');

const publicUrl = 'https://vikasjangra99.github.io/orbit-learning/';

test('new learner can onboard and complete the first practice question', async ({ page }) => {
  await page.goto(publicUrl, { waitUntil: 'networkidle' });
  await expect(page.getByRole('heading', { name: 'Learn what matters to you.' })).toBeVisible();

  await page.getByRole('button', { name: /Create your learning space/ }).click();
  await page.getByPlaceholder('Your name or nickname').fill('QA Learner Alpha');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: /Mathematics/ }).click();
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: /Build a foundation/ }).click();
  await page.getByRole('button', { name: 'Continue' }).click();
  await expect(page.getByText('Welcome, QA Learner Alpha.')).toBeVisible();
  await page.getByRole('button', { name: /Enter my learning space/ }).click();

  await expect(page.getByRole('heading', { name: /Welcome, QA Learner Alpha/ })).toBeVisible();
  await page.getByRole('button', { name: /Start session/ }).click();
  await expect(page.locator('.session-dialog')).toBeVisible();
  await page.getByRole('button', { name: '340 rupees' }).click();
  await page.getByRole('button', { name: /Check answer/ }).click();
  await expect(page.getByText('That is right.')).toBeVisible();
});

test('learner can move between primary views', async ({ page }) => {
  await page.goto(publicUrl, { waitUntil: 'networkidle' });
  await page.getByRole('button', { name: /Already learning/ }).click();
  await page.locator('.nav-item[data-view="learn"]').click();
  await expect(page.getByRole('heading', { name: /Choose your thread/ })).toBeVisible();
  await page.locator('.nav-item[data-view="progress"]').click();
  await expect(page.getByRole('heading', { name: /Progress, with context/ })).toBeVisible();
  await page.locator('.settings-button[data-view="profile"]').click();
  await expect(page.getByRole('heading', { name: /Make it yours/ })).toBeVisible();
});
